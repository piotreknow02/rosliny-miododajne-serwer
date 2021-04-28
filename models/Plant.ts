import { DataTypes, Model, Relationships } from "../deps.ts";

export class Plant extends Model {
  static table = "rosliny";
  static timestamps = false;
  static fields = {
    Id: {
      type: DataTypes.INTEGER,
      unique: true,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      length: 10,
    },
    Id_rodzaju_rosliny: {
      type: DataTypes.INTEGER,
      allowNull: false,
      length: 10,
    },
    Nazwa: {
      type: DataTypes.STRING,
      unique: true,
      allowNull: false,
      length: 30,
    },
    Nazwa_lacinska: {
      type: DataTypes.STRING,
      unique: true,
      allowNulls: false,
      length: 40,
    },
    Wydajnosc_miodowa: {
      type: DataTypes.INTEGER,
      allowNull: true,
      length: 10,
    },
    Wydajnosc_pylkowa: {
      type: DataTypes.INTEGER,
      allowNull: true,
      length: 10,
    },
    Zdjecie: {
      type: DataTypes.TEXT,
      allowNull: true,
      length: 50000,
    },
  };
  static category()
  {
    return this.hasOne(Category);
  }
  static country()
  {
    return this.hasMany(Country);
  }
}

export class Country extends Model {
  static table = "kraje";
  static timestamps = false;
  static fields = {
    Id: {
      type: DataTypes.INTEGER,
      unique: true,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      length: 10,
    },
    Kraj: {
      type: DataTypes.STRING,
      unique: true,
      notNull: true,
      length: 40
    },
  };
}

export class Category extends Model{
  static table = "kategorie"
  static timestamps = false;
  static fields = {
    Id: {
      type: DataTypes.INTEGER,
      unique: true,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      length: 10,
    },
    Nazwa: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
      length: 30
    },
  };
}
export const PlantCountry = Relationships.manyToMany(Plant, Country);
export const PlantCategory = Relationships.belongsTo(Category, Plant);