xquery version "2004-draft";
(:: pragma bea:local-element-complex-parameter parameter="$addUser1" type="AddUserResponseType/addUser" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:createAccountResponse" location="../xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/CBO2CreateAccountResponse/";

declare function xf:CBO2CreateAccountResponse($addUser1 as element())
    as element(ns2:createAccountResponse) {
        <ns2:createAccountResponse>
            <ns0:result>
                <ns0:code>{ data($addUser1/ERROR_NUM) }</ns0:code>
                <ns0:message>{ data($addUser1/ERROR_STRING) }</ns0:message>
            </ns0:result>
            <ns0:serverTransactionId>{ fn-bea:uuid() }</ns0:serverTransactionId>
            <ns2:webUserObjid>{ data($addUser1/WEBUSER_OBJID) }</ns2:webUserObjid>
        </ns2:createAccountResponse>
        
};

declare variable $addUser1 as element() external;

xf:CBO2CreateAccountResponse($addUser1)