import { Optional } from 'sequelize';
import { Table, Column, Model} from 'sequelize-typescript';

interface DepartmentAttributes {
    id: number;
    name: string;
}

export interface DepartmentCreationAttributes extends Optional<DepartmentAttributes, 'id'> {}

@Table({ tableName: 'departments', timestamps: false })
export class Department extends Model<DepartmentAttributes, DepartmentCreationAttributes> {
    @Column
    public name!: string;

    toString(): string {
        return `{ Department { Id: ${this.id}, Name: ${this.name} } }`;
    }
}
