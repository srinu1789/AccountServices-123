xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$deleteEsnFromAccountRequest1" element="ns1:deleteEsnFromAccountRequest" location="../../xsd/MobileAccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:getESNFromMINRequest" location="../../../../PhoneServices/CoreServices/xsd/PhoneCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/PhoneCoreServices";
declare namespace ns1 = "http://b2b.tracfone.com/MobileAccountServices";
declare namespace ns3 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/Mobile/DeleteEsnFromAccount2CoreGetEsnFromMinRequest/";

declare function xf:DeleteEsnFromAccount2CoreGetEsnFromMinRequest($deleteEsnFromAccountRequest1 as element(ns1:deleteEsnFromAccountRequest))
    as element(ns2:getESNFromMINRequest) {
        <ns2:getESNFromMINRequest>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($deleteEsnFromAccountRequest1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($deleteEsnFromAccountRequest1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:brandName>{ data($deleteEsnFromAccountRequest1/ns0:brandName) }</ns0:brandName>
            <ns0:sourceSystem>{ data($deleteEsnFromAccountRequest1/ns0:sourceSystem) }</ns0:sourceSystem>
            <ns0:language>{ data($deleteEsnFromAccountRequest1/ns0:language) }</ns0:language>
            <ns2:min>{ data($deleteEsnFromAccountRequest1/ns1:min) }</ns2:min>
        </ns2:getESNFromMINRequest>
};

declare variable $deleteEsnFromAccountRequest1 as element(ns1:deleteEsnFromAccountRequest) external;

xf:DeleteEsnFromAccount2CoreGetEsnFromMinRequest($deleteEsnFromAccountRequest1)