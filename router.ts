import { Router, RouterContext } from "./deps.ts";
import PlantController from "./controllers/plantController.ts";

const router: Router = new Router();
const controller = new PlantController("127.0.0.1:3306");

router.post("/plants", async (ctx: RouterContext) => {
    ctx.response.type = "application/json";
    console.log((await ctx.request.body()).value);
    ctx.response.body = await controller.GetFromQuery(await ctx.request.body().value);
});

router.get("/all-plants", (ctx: RouterContext) => {
    
});

export { router };
