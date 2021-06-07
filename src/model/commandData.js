'use strict';
import { Model, DataTypes } from 'sequelize';

export class CommandData extends Model {
  static init(sequelize) {
    return super.init({
      id: {
        defaultValue: DataTypes.UUIDV4,
        type: DataTypes.UUID,
        primaryKey: true,
        unique: true
      },
      key: DataTypes.STRING,
      value: DataTypes.STRING
    }, { createdAt: 'created_at', updatedAt: 'updated_at', tableName: 'command_data', sequelize });
  }

  static associate(models) {
    this.commandAssociation = this.belongsTo(models.Command);
  }
}
