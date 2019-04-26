xquery version "2004-draft";
(:: pragma bea:local-element-complex-parameter parameter="$createContact1" type="CreateContactResponseType/CreateContact" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:createContactResponseType" location="../xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/ServiceProvesioningServices/CoreServices/Transformations/CBO2CreateContactResponse/";

declare function xf:CBO2CreateContactResponse($createContact1 as element())
    as element(ns2:createContactResponseType) {
        <ns2:createContactResponseType>
            <ns0:result>
                <ns0:code>{ data($createContact1/ERROR_NUM) }</ns0:code>
                <ns0:message>{ data($createContact1/ERROR_STRING) }</ns0:message>
            </ns0:result>
            <ns0:serverTransactionId>{ fn-bea:uuid() }</ns0:serverTransactionId>
            <ns2:contactObjectId>{ data($createContact1/CONTACT_OBJID) }</ns2:contactObjectId>
        </ns2:createContactResponseType>
};

declare variable $createContact1 as element() external;

xf:CBO2CreateContactResponse($createContact1)