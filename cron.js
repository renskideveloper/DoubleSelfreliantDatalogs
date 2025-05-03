const axios = require('axios');

module.exports = function start14MinRequest(url) {
  async function sendRequest() {
    try {
      const response = await axios.get(url);
      console.log(`Response received at ${new Date().toLocaleTimeString()}:`, response.status);
    } catch (error) {
      console.error(`Error at ${new Date().toLocaleTimeString()}:`, error.message);
    }
  }

  // Start interval
  setInterval(sendRequest, 14 * 60 * 1000);
  sendRequest(); // Optional immediate call
};