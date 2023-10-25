import { DataTypes, Model } from 'sequelize';
import seq from '../dbInit.js';

export class Person extends Model {
    /**
     * @param {string} name
     * @param {string} address
     * @param {Date} birthDate
     * @returns {object}
     */
    static getCreationAttributes = (name, address, birthDate) => ({
        name: name,
        address: address,
        birthDate: birthDate,
    });

    toString() {
        return `{ Person { Id: ${this.id}, Name: ${this.name}, Address: ${this.address}, BirthDate: ${this.birthDate} } }`;
    }
}

Person.init({
    id: {
        primaryKey: true,
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
    },
    name: {
        type: DataTypes.TEXT,
    },
    address: {
        type: DataTypes.TEXT,
    },
    birthDate: {
        type: DataTypes.DATEONLY,
    },
}, {
    sequelize: seq,
    modelName: 'Person',
    underscored: true,
    tableName: 'people',
    timestamps: false,
});
