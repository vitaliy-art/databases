import { Optional } from 'sequelize';
import { Department } from './department.model';
import { Person } from './person.model';
import { BelongsTo, Column, DataType, ForeignKey, IsUUID, Model, PrimaryKey, Table } from 'sequelize-typescript';
import { v4 } from 'uuid';

export enum Position {
    STAFFER = 'Staffer',
    MANAGER = 'Manager',
    BOSS = 'Boss',
}

interface EmployeeAttributes {
    id: string;
    position: Position;
    departmentId: number;
    personId: string;
}

export interface EmployeeCreationAttributes extends Optional<EmployeeAttributes, 'id'> {}

@Table({ tableName: 'employees', timestamps: false })
export class Employee extends Model<EmployeeAttributes, EmployeeCreationAttributes> {
    @IsUUID(4)
    @PrimaryKey
    @Column
    public id: string = v4();

    @Column(DataType.ENUM(...Object.keys(Position).filter(i => isNaN(Number(i)))))
    public position!: string;

    @BelongsTo(() => Department)
    public department!: Department;

    @ForeignKey(() => Department)
    @Column
    public departmentId!: number;

    @BelongsTo(() => Person)
    public person!: Person;

    @ForeignKey(() => Person)
    @Column
    public personId!: string;

    toString(): string {
        return `{ Employee: { Id: ${this.id}, Department: ${this.department?.toString()}, Person: ${this.person?.toString()}, Position: ${this.position} } }`;
    }
}
