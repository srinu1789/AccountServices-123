xquery version "2004-draft";
(:: pragma bea:local-element-complex-parameter parameter="$removeMulitpleEsnToAccount1" type="RemoveMultipleEsnToAccountResponseType/removeMulitpleEsnToAccount" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:removeMultipleEsnToAccountResponse" location="../xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/CBO2RemoveEsnFromAccountResponse/";

declare function xf:CBO2RemoveEsnFromAccountResponse($removeMulitpleEsnToAccount1 as element())
    as element(ns2:removeMultipleEsnToAccountResponse) {
        <ns2:removeMultipleEsnToAccountResponse>
            <ns0:result>
                <ns0:code>{ data($removeMulitpleEsnToAccount1/ERROR_NUM0) }</ns0:code>
                <ns0:message>{ data($removeMulitpleEsnToAccount1/ERROR_STRING0) }</ns0:message>
            </ns0:result>
            <ns2:clarifySessionId>{ data($removeMulitpleEsnToAccount1/CLARIFY_SESSION_ID) }</ns2:clarifySessionId>
            <ns2:server>{ data($removeMulitpleEsnToAccount1/SERVER) }</ns2:server>
        </ns2:removeMultipleEsnToAccountResponse>
};

declare variable $removeMulitpleEsnToAccount1 as element() external;

xf:CBO2RemoveEsnFromAccountResponse($removeMulitpleEsnToAccount1)