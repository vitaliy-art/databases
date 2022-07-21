import { AppDataSource } from "./data-source"
import { EntityService } from "./service/EntityService"

let entityService = new EntityService(AppDataSource);
entityService.initialize().then(
    async () => {

    }
)
