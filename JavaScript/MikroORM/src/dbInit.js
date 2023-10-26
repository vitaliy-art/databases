import { MikroORM } from '@mikro-orm/sqlite';
import { departmentSchema } from './models/Department.js';
import { personSchema } from './models/Person.js';
import { employeeSchema } from './models/Employee.js';

export default await MikroORM.init({
    entities: [departmentSchema, personSchema, employeeSchema],
    dbName: 'db.bd',
    type: 'sqlite',
    allowGlobalContext: true,
});
