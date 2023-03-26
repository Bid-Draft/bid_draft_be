import { createConsumer } from "@rails/actioncable"

export default createConsumer('http://localhost:3000/api/v1/cable')