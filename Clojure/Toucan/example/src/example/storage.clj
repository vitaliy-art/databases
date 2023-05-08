(ns example.storage
  (:require [clojure.string :as str]
            [toucan.db :as db])
  (:require [toucan.models :as tmodels])
  (:require [clj-uuid :as uuid]))


(tmodels/defmodel Department :departments)
(tmodels/defmodel Person :people )
(tmodels/defmodel Employee :employees)

(defn get-department
  [^Long id] (Department id))

(defn get-person
  [^String id] (Person id))

(defn- hidrate-employee!
  [emp] (assoc emp :person (get-person (:person_id emp)) :department (get-department (:department_id emp))))

(defn get-employee
  [^String id]
  (let [emp (Employee id)]
    (hidrate-employee! emp)))

(defn get-all-departments [] (Department))

(defn get-all-people
  [] (Person))

(defn get-all-employees
  []
  (map hidrate-employee! (Employee)))

(defn add-new-department!
  [^String name] (db/insert! Department {:name name}))

(defn add-new-person!
  [^String name ^String address ^Long birth-year ^Long birth-month ^Long birth-day]
  (let [id (uuid/v4)]
    (db/simple-insert! Person {:id (uuid/to-string id)
                               :name name
                               :address address
                               :birth_date (str/join "-" [birth-year birth-month birth-day])})
    ;; because toucan tryes to return inserted records by getting element by id = count() or something
    ;; see https://github.com/metabase/metabase/issues/6295
    (get-person id)))

(def position-map {:boss 1 :manager 2 :staffer 3})

(defn add-new-employee!
  ([^String person-id ^Long department-id ^Long position]
  (let [id (uuid/v4)]
    (db/simple-insert! Employee {:id (uuid/to-string id)
                                            :person_id person-id
                                            :department_id department-id
                                            :position position})
    (let [emp (get-employee id)]
      (hidrate-employee! emp))))

  ([department ^String name ^String address ^Long birth-year ^Long birth-month ^Long birth-day ^Long position]
  (let [per (add-new-person! name address birth-year birth-month birth-day)]
    (add-new-employee! (:id per) (:id department) position))))

(defn update-department!
  [dep]
  (db/update! Department (:id dep) {:name (:name dep)})
  (Department (:id dep)))

(defn update-person!
  [per]
  (db/update! Person (:id per) {:name (:name per)
                                :address (:address per)
                                :birth_date (:birth_date per)})
  (Person (:id per)))

(defn delete-employee!
  [emp] (db/simple-delete! Employee :id (:id emp)))

(defn delete-employees!
  [range] (doseq [emp range] (delete-employee! emp)))

(defn delete-department!
  [dep]
  (db/delete! Department :id (:id dep))
  (let [employees (db/simple-select Employee {:where [:= :department_id (:id dep)]})]
    (delete-employees! employees)))

(defn delete-person!
  [per]
  (db/simple-delete! Person :id (:id per))
  (let [employees (db/simple-select Employee {:where [:= :person_id (:id per)]})]
    (delete-employees! employees)))

(defn delete-people!
  [range] (doseq [per range] (delete-person! per)))

(defn delete-departments!
  [range] (doseq [dep range] (delete-department! dep)))

(defn format-department
  [dep]
  (format
   "{ Department : { ID: %s, Name: %s } }"
   (:id dep)
   (:name dep)))

(defn format-person
  [per]
  (format
   "{ Person: { Id: %s, Name: %s, Address: %s, BirthDate: %s } }"
   (:id per)
   (:name per)
   (:address per)
   (:birth_date per)))

(defn format-employee
  [emp]
  (format
   "{ Employee: { Id: %s, Person: %s, Department: %s, Position: %s } }"
   (:id emp)
   (format-person (:person emp))
   (format-department (:department emp))
   (if (= (:position emp) (position-map :boss)) "Boss"
       (if (= (:position emp) (position-map :manager)) "Manager"
           "Staffer"))))
