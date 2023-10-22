import { defineConfig } from '@mikro-orm/sqlite';
import { Department } from './models/Department';
import { Person } from './models/Person';
import { Employee } from './models/Employee';

export default defineConfig({
    entities: [Department, Person, Employee],
    dbName: 'db.bd',
    type: 'sqlite',
    allowGlobalContext: true,
    driverOptions: {
        'foreign_keys': 'ON',
    },
    // debug: true,
});
