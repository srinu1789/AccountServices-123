xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getAccountInfoFromEsnRequest1" element="ns1:getAccountInfoFromEsnRequest" location="../xsd/AccountDataServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:checkMyAccountRequest" location="../xsd/AccountManagerDS-BPEL.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/OAuthAccountManagerDataService";
declare namespace ns1 = "http://www.tracfone.com/AccountDataServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/DataServices/transformations/getAccountInfoFromEsnRequest/";

declare function xf:getAccountInfoFromEsnRequest($getAccountInfoFromEsnRequest1 as element(ns1:getAccountInfoFromEsnRequest))
    as element(ns2:checkMyAccountRequest) {
        <ns2:checkMyAccountRequest>
            <ns0:requestToken>
                <ns0:clientTransactionId>{ data($getAccountInfoFromEsnRequest1/ns0:requestToken/ns0:clientTransactionId) }</ns0:clientTransactionId>
                <ns0:clientId>{ data($getAccountInfoFromEsnRequest1/ns0:requestToken/ns0:clientId) }</ns0:clientId>
            </ns0:requestToken>
            <ns0:brandName>{ data($getAccountInfoFromEsnRequest1/ns0:brandName) }</ns0:brandName>
            <ns0:sourceSystem>{ data($getAccountInfoFromEsnRequest1/ns0:sourceSystem) }</ns0:sourceSystem>
            {
                for $language in $getAccountInfoFromEsnRequest1/ns0:language
                return
                    <ns0:language>{ data($language) }</ns0:language>
            }
            <ns2:esn>{ data($getAccountInfoFromEsnRequest1/ns1:esn) }</ns2:esn>
        </ns2:checkMyAccountRequest>
};

declare variable $getAccountInfoFromEsnRequest1 as element(ns1:getAccountInfoFromEsnRequest) external;

xf:getAccountInfoFromEsnRequest($getAccountInfoFromEsnRequest1)