xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2= "http://www.tracfone.com/AccountCoreServices";

(:: import schema at "../xsd/AccountCoreServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $encryptAccountPassword as element() external;

declare function local:func($encryptAccountPassword as element()) as element() (:: schema-element(ns2:encryptPasswordResponse) ::) {
    <ns2:encryptPasswordResponse>
            <com:result>
                <com:code>{ data($encryptAccountPassword/ERROR_NUM) }</com:code>
                <com:message>{ data($encryptAccountPassword/ERROR_STRING) }</com:message>
            </com:result>
            <ns2:passwordEncrypted>{ data($encryptAccountPassword/PASSWORD) }</ns2:passwordEncrypted>
        </ns2:encryptPasswordResponse>
};

local:func($encryptAccountPassword)
