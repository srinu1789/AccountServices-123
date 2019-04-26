xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$addEsnToAccountRequest1" element="ns4:addEsnToAccountRequest" location="../xsd/AccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns5:addEsnToAccountRequest" location="../../DataServices/xsd/AccountDataServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns1 = "http://www.tracfone.com/CommonTypes";
declare namespace ns4 = "http://b2b.tracfone.com/AccountServices";
declare namespace ns3 = "http://www.tracfone.com/SecurityCommonTypes";
declare namespace ns0 = "http://www.tracfone.com/PhoneCommonTypes";
declare namespace ns5 = "http://www.tracfone.com/AccountDataServices";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/addEsntoAccount_B2B_To_CORE_Request/";

declare function xf:addEsntoAccount_B2B_To_CORE_Request($addEsnToAccountRequest1 as element(ns4:addEsnToAccountRequest))
    as element(ns5:addEsnToAccountRequest) {
        <ns5:addEsnToAccountRequest>
            <ns1:requestToken>{ $addEsnToAccountRequest1/ns1:requestToken/@* , $addEsnToAccountRequest1/ns1:requestToken/node() }</ns1:requestToken>
            <ns1:brandName>{ data($addEsnToAccountRequest1/ns1:brandName) }</ns1:brandName>
            <ns1:sourceSystem>{ data($addEsnToAccountRequest1/ns1:sourceSystem) }</ns1:sourceSystem>
            {
                for $language in $addEsnToAccountRequest1/ns1:language
                return
                    <ns1:language>{ data($language) }</ns1:language>
            }
            <ns5:accountCredentials>
            </ns5:accountCredentials>
            <ns5:actionType>{ data($addEsnToAccountRequest1/ns4:actionType) }</ns5:actionType>
            <ns5:esn>{ data($addEsnToAccountRequest1/ns4:esn) }</ns5:esn>
        </ns5:addEsnToAccountRequest>
};

declare variable $addEsnToAccountRequest1 as element(ns4:addEsnToAccountRequest) external;

xf:addEsntoAccount_B2B_To_CORE_Request($addEsnToAccountRequest1)