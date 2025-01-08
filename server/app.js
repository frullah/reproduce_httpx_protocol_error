const fastify = require('fastify')

const app = fastify({
  http2: true,
  http2SessionTimeout: 100,
  logger: true,
});

app.get('/', async (request, reply) => ({ message: 'Hello' }));

app.listen({ port: 3100 });
console.log(`Server running at http://localhost:3100/`);
