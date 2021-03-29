import { Client, config } from "../deps.ts";
import Plant from "../models/Plant.ts";

export default class PlantController {
  private client!: Client;
  constructor(host: string)
  {
    const envfile = config()
    new Client().connect({
      hostname: host,
      username: "root",
      db: "RoslinyMiododajne",
      password: Deno.env.get("MYSQL_ROOT_PASSWORD") || envfile.MYSQL_ROOT_PASSWORD,
    }).then(cli => this.client = cli);
  }
  async getAllPlants(order?: string): Promise<Plant[]>
  {
    return await this.client.execute(`SELECT * FROM rosliny ORDER BY ${order == null ? "Id" : order}`) as Plant[];
  }
  async GetFromQuery(query: string): Promise<Plant[] | Error>
  {
    try
    {
      return await this.client.execute(query) as Plant[];
    }
    catch
    {
      throw new Error("Invalid query");
    }
  }
}