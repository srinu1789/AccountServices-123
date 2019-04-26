xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.tracfone.com/AccountCoreServices";
(:: import schema at "../xsd/AccountCoreServices.xsd" ::)

declare variable $encryptPasswordRequest as element() (:: schema-element(ns1:encryptAccountPasswordRequest) ::) external;

declare function local:func($encryptPasswordRequest as element() (:: schema-element(ns1:encryptAccountPasswordRequest) ::)) as element() {
    <INPUT TASK="encryptPassword">
        <PASSWORD>{ data($encryptPasswordRequest/ns1:password) }</PASSWORD>
    </INPUT>

};

local:func($encryptPasswordRequest)
