-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_employees" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "department_id" INTEGER NOT NULL,
    "person_id" TEXT NOT NULL,
    "position" INTEGER NOT NULL,
    CONSTRAINT "employees_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "departments" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "employees_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "people" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_employees" ("department_id", "id", "person_id", "position") SELECT "department_id", "id", "person_id", "position" FROM "employees";
DROP TABLE "employees";
ALTER TABLE "new_employees" RENAME TO "employees";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
