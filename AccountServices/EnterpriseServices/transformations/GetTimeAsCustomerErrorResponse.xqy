xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $code as xs:string external;
declare variable $message as xs:string external;

declare function local:GetTimeAsCustomerErrorResponse($code as xs:string, 
                                                      $message as xs:string) 
                                                      as element() (:: schema-element(ns1:getTimeAsCustomerResponse) ::) {
    <ns1:getTimeAsCustomerResponse>
        <com:result>
                    <com:code>{ fn:data($code) }</com:code>
                    <com:message>{ fn:data($message) }</com:message>
                </com:result>
    </ns1:getTimeAsCustomerResponse>
};

local:GetTimeAsCustomerErrorResponse($code, $message)
