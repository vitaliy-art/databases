import { Optional } from 'sequelize';
import { Column, DataType, IsUUID, Model, PrimaryKey, Table } from 'sequelize-typescript';
import { v4 } from 'uuid';

interface PersonAttributes {
    id: number;
    name: string;
    address: string;
    birthDate: Date;
}

export interface PersonCreationAttributes extends Optional<PersonAttributes, 'id'> {}

@Table({ tableName: 'people', timestamps: false })
export class Person extends Model<PersonAttributes, PersonCreationAttributes> {
    @IsUUID(4)
    @PrimaryKey
    @Column
    public id: string = v4();

    @Column
    public name!: string;

    @Column
    public address!: string;

    @Column(DataType.DATEONLY)
    public birthDate!: string;

    toString(): string {
        return `{ Person: { Id: ${this.id}, Name: ${this.name}, Address: ${this.address}, BirthDate: ${this.birthDate} } }`;
    }
}
