import { MigrationInterface, QueryRunner } from "typeorm";

export class Init1658413718334 implements MigrationInterface {
    name = 'Init1658413718334'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE "people" ("id" varchar PRIMARY KEY NOT NULL, "name" varchar NOT NULL, "address" varchar NOT NULL, "birthDate" date NOT NULL)`);
        await queryRunner.query(`CREATE TABLE "employee" ("id" varchar PRIMARY KEY NOT NULL, "position" varchar CHECK( "position" IN ('0','1','2') ) NOT NULL, "departmentId" integer, "personId" varchar)`);
        await queryRunner.query(`CREATE TABLE "department" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL)`);
        await queryRunner.query(`CREATE TABLE "temporary_employee" ("id" varchar PRIMARY KEY NOT NULL, "position" varchar CHECK( "position" IN ('0','1','2') ) NOT NULL, "departmentId" integer, "personId" varchar, CONSTRAINT "FK_9ad20e4029f9458b6eed0b0c454" FOREIGN KEY ("departmentId") REFERENCES "department" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION, CONSTRAINT "FK_c6dc0c24b090639f20b86baf30c" FOREIGN KEY ("personId") REFERENCES "people" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION)`);
        await queryRunner.query(`INSERT INTO "temporary_employee"("id", "position", "departmentId", "personId") SELECT "id", "position", "departmentId", "personId" FROM "employee"`);
        await queryRunner.query(`DROP TABLE "employee"`);
        await queryRunner.query(`ALTER TABLE "temporary_employee" RENAME TO "employee"`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "employee" RENAME TO "temporary_employee"`);
        await queryRunner.query(`CREATE TABLE "employee" ("id" varchar PRIMARY KEY NOT NULL, "position" varchar CHECK( "position" IN ('0','1','2') ) NOT NULL, "departmentId" integer, "personId" varchar)`);
        await queryRunner.query(`INSERT INTO "employee"("id", "position", "departmentId", "personId") SELECT "id", "position", "departmentId", "personId" FROM "temporary_employee"`);
        await queryRunner.query(`DROP TABLE "temporary_employee"`);
        await queryRunner.query(`DROP TABLE "department"`);
        await queryRunner.query(`DROP TABLE "employee"`);
        await queryRunner.query(`DROP TABLE "people"`);
    }

}
