xquery version "2004-draft";
(:: pragma bea:local-element-complex-parameter parameter="$getPassword1" type="getPasswordResponseType/getPassword" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:getPasswordResponse" location="../xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/CBO2getPasswordResponse/";

declare function xf:CBO2getPasswordResponse($getPassword1 as element())
    as element(ns2:getPasswordResponse) {
        <ns2:getPasswordResponse>
            <ns0:result>
                <ns0:code>{ data($getPassword1/ERROR_NUM) }</ns0:code>
                <ns0:message>{ data($getPassword1/ERROR_STRING) }</ns0:message>
            </ns0:result>
            <ns2:webUserObjid>{ data($getPassword1/WEB_USER_OBJID) }</ns2:webUserObjid>
            <ns2:contactfname>{ data($getPassword1/CONTACT_FNAME) }</ns2:contactfname>
            <ns2:contactlname>{ data($getPassword1/CONTACT_LNAME) }</ns2:contactlname>
            <ns2:password>{ data($getPassword1/PASSWORD) }</ns2:password>
        </ns2:getPasswordResponse>
};

declare variable $getPassword1 as element() external;

xf:CBO2getPasswordResponse($getPassword1)