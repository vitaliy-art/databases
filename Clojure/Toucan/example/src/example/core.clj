(ns example.core
  (:gen-class)
  (:require [clojure.string :as str]
            [toucan.db :as db])
  (:require [toucan.models :as models])
  (:require [example.storage :as storage]))


(defn init-db
  []
  (db/set-default-db-connection!
   {:classname "org.sqlite.JDBC"
    :subprotocol "sqlite"
    :subname "bd.db"}))

(defn -main
  [& args]
  (init-db)
  (print "\nClean up database... ")

  (storage/delete-departments! (storage/get-all-departments))
  (storage/delete-people! (storage/get-all-people))
  (storage/delete-employees! (storage/get-all-employees))
  (println "done")

  (print "\nAdd departments... ")
  (let [dep1 (storage/add-new-department! "Department One")
        dep2 (storage/add-new-department! "Department Two")]

    (println "done")
    (println "\nAdded departments:")
    (println (str/join "\n" (map storage/format-department [dep1 dep2])))

    (print "\nAdd people... ")
    (let [per1 (storage/add-new-person! "Ivan" "Moscow" 1990 10 2)
          per2 (storage/add-new-person! "John" "London" 1998 1 14)]

      (println "done")
      (println "\nAdded people:")
      (println (str/join "\n" (map storage/format-person [per1 per2])))

      (print "\nAdd employees... ")
      (storage/add-new-employee! (:id per1) (:id dep1) (storage/position-map :staffer))
      (storage/add-new-employee! (:id per2) (:id dep1) (storage/position-map :staffer))
      (storage/add-new-employee! dep2 "Nick" "Berlin" 1995 2 23 (storage/position-map :manager))
      (storage/add-new-employee! dep2 "Stan" "Oslo" 1988 4 21 (storage/position-map :boss))
      (println "done")

      (println "\nAdded employees:")
      (println (str/join "\n" (map storage/format-employee (storage/get-all-employees))))

      (print "\nDelete Department One... ")
      (storage/delete-department! dep1)
      (println "done")

      (print "\nUpdate Department Two... ")
      (storage/update-department! (assoc dep2 :name "Department"))
      (println "done")

      (print "\nUpdate Ivan... ")
      (storage/update-person! (assoc per1 :address "Tula"))
      (println "done")

      (println "\nRemain departments:")
      (println (str/join "\n" (map storage/format-department (storage/get-all-departments))))

      (println "\nRemain people:")
      (println (str/join "\n" (map storage/format-person (storage/get-all-people))))

      (println "\nRemain employees:")
      (println (str/join "\n" (map storage/format-employee (storage/get-all-employees))))

      (print "\nDelete Department Two... ")
      (storage/delete-department! dep2)
      (println "done")

      (println (str/join " " ["\nRemain departments count:" (count (storage/get-all-departments))]))

      (println (str/join " " ["\nRemain people count:" (count (storage/get-all-people))]))

      (println (str/join " " ["\nRemain employees count:" (count (storage/get-all-employees))]))

      (print "\nDelete people... ")
      (storage/delete-people! (storage/get-all-people))
      (println "done")

      (println (str/join " " ["\nRemain people count:" (count (storage/get-all-people))])))))

(comment
  (-main)
  )
