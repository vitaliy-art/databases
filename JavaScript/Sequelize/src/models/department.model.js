import { DataTypes, Model } from 'sequelize';
import seq from '../dbInit.js';

export class Department extends Model {
    /**
     * @param {string} name
     * @returns {object}
     */
    static getCreationAttributes = (name) => ({
        name: name,
    });

    toString() {
        return `{ Department { Id: ${this.id}, Name: ${this.name} } }`;
    }
}

Department.init({
    name: {
        type: DataTypes.TEXT,
    },
}, {
    sequelize: seq,
    modelName: 'Department',
    underscored: true,
    tableName: 'departments',
    timestamps: false,
});
