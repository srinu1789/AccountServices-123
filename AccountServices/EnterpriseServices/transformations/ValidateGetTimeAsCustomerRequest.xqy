xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/AccountServices";
(:: import schema at "../xsd/AccountServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $ValidateGetTimeAsCustomerType as element() (:: schema-element(ns1:getTimeAsCustomerRequest) ::) external;

declare function local:ValidateGetTimeAsCustomer($ValidateGetTimeAsCustomerType as element() (:: schema-element(ns1:getTimeAsCustomerRequest) ::)) as element() (:: schema-element(ns1:getTimeAsCustomerResponse) ::) {
    <ns1:getTimeAsCustomerResponse>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($ValidateGetTimeAsCustomerType/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($ValidateGetTimeAsCustomerType/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        
           {
            if (count($ValidateGetTimeAsCustomerType/ns1:applicationId)=0 or (count($ValidateGetTimeAsCustomerType/ns1:applicationId)>0 and fn:string-length(fn-bea:trim($ValidateGetTimeAsCustomerType/ns1:applicationId)) = 0))
            then (<com:result>
                    <com:code>{ fn:data('-311') }</com:code>
                    <com:message>{ fn:data('Please provide a valid Application Request Number') }</com:message>
                </com:result>)
            else (if (count($ValidateGetTimeAsCustomerType/ns1:min)=0 or (count($ValidateGetTimeAsCustomerType/ns1:min)>0 and fn:string-length(fn-bea:trim($ValidateGetTimeAsCustomerType/ns1:min)) = 0))
            then (<com:result>
                    <com:code>{ fn:data('-311') }</com:code>
                    <com:message>{ fn:data('Please provide a valid Mobile Number') }</com:message>
                </com:result>)
            else ())
        }
           <com:serverTransactionId>{fn-bea:uuid()}</com:serverTransactionId>
    </ns1:getTimeAsCustomerResponse>
};

local:ValidateGetTimeAsCustomer($ValidateGetTimeAsCustomerType)
