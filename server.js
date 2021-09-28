/**
 * @author Paul Kalnitski
 * @contact kalnitski@polydev.io
 * @copyright 2019-2020 All rights reserved
 */
const Retranslator = require("./src");

// Create TCP (Socket) server on 20163 port
let retranslator = new Retranslator(20163);

retranslator.emitter.on('message', message => {
  console.log(message);
});

// Start listening
retranslator.start();
