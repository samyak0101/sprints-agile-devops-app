const SERVER_URL = process.env.SERVER_URL || "http://localhost:5238/post/variables";
const EXPRESS_URL = process.env.EXPRESS_URL || "http://localhost:3001";
const HOSTNAME = process.env.HOSTNAME || "db2";
const DATABASE = process.env.DATABASE || "AGDev43";
const USER = process.env.USER || "root";
const PASSWORD = process.env.PASSWORD || "mc";
const PORTNUM = process.env.PORTNUM || "3306";

export { SERVER_URL, EXPRESS_URL, HOSTNAME, DATABASE, USER, PASSWORD, PORTNUM };
