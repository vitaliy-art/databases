import { DataTypes, Model } from 'sequelize';
import { Department } from './department.model.js';
import { Person } from './person.model.js';
import seq from '../dbInit.js';

/**
 * @readonly
 * @enum {string}
 */
export const Position = {
    BOSS: 'Boss',
    MANAGER: 'Manager',
    STAFFER: 'Staffer',
};

export class Employee extends Model {
    /**
     *
     * @param {Department} department
     * @param {Person} person
     * @param {Position} position
     * @returns {object}
     */
    static getCreationAttributes = (department, person, position) => ({
        department_id: department.id,
        person_id: person.id,
        position: position,
    });

    toString() {
        return `{ Employee { Id: ${this.id}, Department: ${this.Department?.toString()}, Person: ${this.Person?.toString()}, Position: ${this.position} } }`;
    }
}

Employee.init({
    id: {
        primaryKey: true,
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
    },
    position: {
        type: DataTypes.ENUM('Boss', 'Manager', 'Staffer'),
    }
}, {
    sequelize: seq,
    modelName: 'Employee',
    underscored: true,
    tableName: 'employees',
    timestamps: false,
});

Employee.belongsTo(Department, { foreignKey: 'department_id', onDelete: 'CASCADE' });
Employee.belongsTo(Person, { foreignKey: 'person_id', onDelete: 'CASCADE' });
