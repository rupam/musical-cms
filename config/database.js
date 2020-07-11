require('dotenv').config({ path: require('find-config')('.env') })

module.exports = ({ env }) => ({
  "defaultConnection": "default",
  "connections": {
    "default": {
      "connector": "mongoose",
      "settings": {
        "uri": `mongodb+srv://${process.env.DATABASE_USERNAME}:${process.env.DATABASE_PASSWORD}@${process.env.DATABASE_HOST}/${process.env.DATABASE_NAME}?retryWrites=true&w=majority`,
        "port": `${process.env.DATABASE_PORT || 27017}`
      },
      "options": {
        "ssl": true
      }
    }
  }
});
