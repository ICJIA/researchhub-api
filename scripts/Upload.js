"use strict";

/* /extensions/uploads/services/Upload.js */

const fs = require("fs");
const crypto = require("crypto");
const _ = require("lodash");
const toArray = require("stream-to-array");

function niceHash(buffer) {
  return crypto
    .createHash("sha256")
    .update(buffer)
    .digest("base64")
    .replace(/=/g, "")
    .replace(/\//g, "-")
    .replace(/\+/, "_");
}

function getTimestamp() {
  return new Date()
    .toJSON()
    .slice(2, -2)
    .replace(/[-:.]/g, "");
}

module.exports = {
  bufferize: async files => {
    if (_.isEmpty(files) === 0) {
      throw "Missing files.";
    }

    // files is always an array to map on
    files = _.isArray(files) ? files : [files];

    const createBuffer = async stream => {
      const parts = await toArray(fs.createReadStream(stream.path));
      const buffers = parts.map(part =>
        _.isBuffer(part) ? part : Buffer.from(part)
      );

      const buffer = Buffer.concat(buffers);

      const nameHead =
        stream.name.split(".").length > 1
          ? _.head(stream.name.split("."))
          : stream.name;

      return {
        tmpPath: stream.path,
        name: stream.name,
        sha256: niceHash(buffer),
        hash: `${nameHead}-${getTimestamp()}`,
        ext:
          stream.name.split(".").length > 1
            ? `.${_.last(stream.name.split("."))}`
            : "",
        buffer,
        mime: stream.type,
        size: (stream.size / 1000).toFixed(2)
      };
    };

    // transform all files in buffer
    return Promise.all(files.map(stream => createBuffer(stream)));
  }
};
