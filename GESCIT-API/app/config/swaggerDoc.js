require('dotenv').config();
const host = process.env.host;
const urlApi = process.env.urlApi;

const swaggerDoc = {
  info: {
    version: "1.0.12",
    title: "My API",
    description: "Documentation automatically generated by the <b>swagger-autogen</b> module."
  },
  host: host + urlApi,
  basePath: "/",
  schemes: ['http','https'],
  consumes: ['application/json'],
  produces: ['application/json'],
  tags: [
    {
      "name": "Configuración",
      "description": "Endpoints para la configuración de la aplicación"
    },
    {
      "name": "Configuración/Usuario",
    },
    {
      "name": "Operaciones",
      "description": "Endpoints para la gestión de operaciones"
    },
    { "name": "Operaciones/Citas" },
    {
      "name": "Catálogos",
      "description": "Endpoints para la gestión de catálogos"
    },
    {
      "name": "Catálogos/Transportes",
      "description": "Endpoints para la gestión de Transportes"
    },
    {
      "name": "Catálogos/Lineas de Transporte",
      "description": "Endpoints para la gestión de Lineas de Transportes"
    },
    {
      "name": "Catálogos/Choferes",
      "description": "Endpoints para la gestión de Lineas de Transportes"
    },
    {
      "name": "Catálogos/Documentos",
      "description": "Endpoints para la gestión de Lineas de Transportes"
    },
    {
      "name": "Herramientas",
      "description": "Endpoints para la consulta de datos adicionales."
    }
  ],
  securityDefinitions: {
    apiKeyAuth: {
      type: "apiKey",
      in: "header",
      name: "X-API-KEY",
      description: "any description..."
    }
  }
};

module.exports = swaggerDoc;