xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getTimeAsCustomerRequest" element="ns1:getTimeAsCustomerRequest" location="../xsd/AccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:getTimeAsCustomerRequest" location="../../DataServices/xsd/AccountDataServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountDataServices";
declare namespace ns1 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/GetTimeAsCustomerRequest/";

declare function xf:GetTimeAsCustomerRequest($getTimeAsCustomerRequest as element(ns1:getTimeAsCustomerRequest))
    as element(ns2:getTimeAsCustomerRequest) {
        let $getTimeAsCustomerRequest := $getTimeAsCustomerRequest
        return
            <ns2:getTimeAsCustomerRequest>
                {
                    let $requestToken := $getTimeAsCustomerRequest/ns0:requestToken
                    return
                        <ns0:requestToken>
                            <ns0:clientTransactionId>{ data($requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                            <ns0:clientId>{ data($requestToken/ns0:clientId) }</ns0:clientId>
                        </ns0:requestToken>
                }
                <ns0:brandName>{ data($getTimeAsCustomerRequest/ns0:brandName) }</ns0:brandName>
                <ns0:sourceSystem>{ data($getTimeAsCustomerRequest/ns0:sourceSystem) }</ns0:sourceSystem>
                {
                    for $language in $getTimeAsCustomerRequest/ns0:language
                    return
                        <ns0:language>{ data($language) }</ns0:language>
                }
                <ns2:applicationId>{ data($getTimeAsCustomerRequest/ns1:applicationId) }</ns2:applicationId>
                <ns2:min>{ data($getTimeAsCustomerRequest/ns1:min) }</ns2:min>
                {
                    for $firstName in $getTimeAsCustomerRequest/ns1:firstName
                    return
                        <ns2:firstName>{ data($firstName) }</ns2:firstName>
                }
                {
                    for $email in $getTimeAsCustomerRequest/ns1:email
                    return
                        <ns2:email>{ data($email) }</ns2:email>
                }
            </ns2:getTimeAsCustomerRequest>
};

declare variable $getTimeAsCustomerRequest as element(ns1:getTimeAsCustomerRequest) external;

xf:GetTimeAsCustomerRequest($getTimeAsCustomerRequest)