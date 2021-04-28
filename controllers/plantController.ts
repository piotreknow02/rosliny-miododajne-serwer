import { Database, MySQLConnector, readCSV } from "../deps.ts";
import { Plant, Country, Category, PlantCountry, PlantCategory } from "../models/Plant.ts";

export default class PlantController {
  private connector: MySQLConnector;
  private db: Database; 
  private initialized = false;
  constructor(host: string)
  {
    this.connector = new MySQLConnector({
      host: host,
      database: "RoslinyMiododajne",
      username: "root",
      password: Deno.env.get("MYSQL_ROOT_PASSWORD")!,
    });
    this.db = new Database(this.connector);
    this.db.link([Plant, Country, Category]);
    this.db.sync({drop: false});
    if (!this.initialized) this.initialize();
  }
  public async getAllPlants(): Promise<Object[]>
  {
    const data = await Plant.all();
    return data;
  }
  private async initialize(): Promise<void>
  {
    await Plant.create(await this.parseCSV("../database/rosliny.csv"));
    await Country.create(await this.parseCSV("../database/kraje.csv"));
    await Category.create(await this.parseCSV("../database/kategorie.csv"));
    this.initialized = true;
  }
  private async parseCSV(csvPath: string)
  {
    const file = await Deno.open(csvPath);
    const csv = readCSV(file);
    let obj: any;
    for await (const row of csv)
    {
      if(row == await csv[0]) continue;
      for await(const [i, val] of row.entries()) {
        obj[await csv[0][i]] = val;
      }
    }
    file.close();
    return obj;
  }
}