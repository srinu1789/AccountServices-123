xquery version "2004-draft";
(:: pragma bea:local-element-complex-parameter parameter="$verifyUser1" type="VerifyUserResponseType/verifyUser" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:validateAccountResponse" location="../xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/CBO2ValidateAccountResponse/";

declare function xf:CBO2ValidateAccountResponse($verifyUser1 as element())
    as element(ns2:validateAccountResponse) {
        <ns2:validateAccountResponse>
            <ns0:result>
                <ns0:code>{ data($verifyUser1/ERROR_NUM) }</ns0:code>
                <ns0:message>{ data($verifyUser1/ERROR_STRING) }</ns0:message>
            </ns0:result>
            <ns2:isValid>
                {
                    if (xs:int(fn:data($verifyUser1/ERROR_NUM)) = 0) then
                        (xs:boolean("true"))
                    else 
                        xs:boolean("false")
                }
</ns2:isValid>
            <ns2:accountWebUserId>{ data($verifyUser1/WEB_USER_OBJID) }</ns2:accountWebUserId>
            <ns2:accountContactObjId>{ data($verifyUser1/CONTACT_OBJID) }</ns2:accountContactObjId>
        </ns2:validateAccountResponse>
};

declare variable $verifyUser1 as element() external;

xf:CBO2ValidateAccountResponse($verifyUser1)