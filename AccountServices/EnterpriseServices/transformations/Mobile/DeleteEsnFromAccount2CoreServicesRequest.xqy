xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$deleteEsnFromAccountRequest1" element="ns3:deleteEsnFromAccountRequest" location="../../xsd/MobileAccountServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:removeMultipleEsnToAccountRequest" location="../../../CoreServices/xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns1 = "http://www.tracfone.com/AccountCommonTypes";
declare namespace ns3 = "http://b2b.tracfone.com/MobileAccountServices";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/EnterpriseServices/transformations/Mobile/DeleteEsnFromAccountToRemoveEsnfromAccountRequest/";

declare function xf:DeleteEsnFromAccountToRemoveEsnfromAccountRequest($deleteEsnFromAccountRequest1 as element(ns3:deleteEsnFromAccountRequest),
    $contactId as xs:string,
    $ESN as xs:string)
    as element(ns2:removeMultipleEsnToAccountRequest) {
        <ns2:removeMultipleEsnToAccountRequest>
            <ns0:requestToken>{ $deleteEsnFromAccountRequest1/ns0:requestToken/@* , $deleteEsnFromAccountRequest1/ns0:requestToken/node() }</ns0:requestToken>
            <ns0:brandName>{ data($deleteEsnFromAccountRequest1/ns0:brandName) }</ns0:brandName>
            <ns0:sourceSystem>{ data($deleteEsnFromAccountRequest1/ns0:sourceSystem) }</ns0:sourceSystem>
            {
                for $language in $deleteEsnFromAccountRequest1/ns0:language
                return
                    <ns0:language>{ data($language) }</ns0:language>
            }
            <ns2:contactObjId>{ $contactId }</ns2:contactObjId>
            <ns2:esn>{ $ESN }</ns2:esn>
            <ns2:businessAccountId>{ data($deleteEsnFromAccountRequest1/ns3:accountId/ns1:accountIdentifierValue) }</ns2:businessAccountId>
        </ns2:removeMultipleEsnToAccountRequest>
};

declare variable $deleteEsnFromAccountRequest1 as element(ns3:deleteEsnFromAccountRequest) external;
declare variable $contactId as xs:string external;
declare variable $ESN as xs:string external;

xf:DeleteEsnFromAccountToRemoveEsnfromAccountRequest($deleteEsnFromAccountRequest1,
    $contactId,
    $ESN)