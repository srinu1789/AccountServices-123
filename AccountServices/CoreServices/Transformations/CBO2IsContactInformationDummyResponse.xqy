xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

(:: pragma bea:local-element-complex-parameter parameter="$isContactInformationDummy1" type="isContactInformationDummyResponseType/isContactInformationDummy" location="../../../TFCommon/Services/CoreCBOServices/xsd/CoreCBOServices.xsd" ::)
(:: pragma bea:global-element-return element="ns2:isContactInformationDummyResponse" location="../xsd/AccountCoreServices.xsd" ::)

declare namespace ns2 = "http://www.tracfone.com/AccountCoreServices";
declare namespace ns1 = "http://www.tracfone.com/RuntimeFault";
declare namespace ns0 = "http://www.tracfone.com/CommonTypes";
declare namespace xf = "http://tempuri.org/AccountServices/CoreServices/Transformations/CBO2IsContactInformationDummyResponse/";

declare function xf:CBO2IsContactInformationDummyResponse($isContactInformationDummy1 as element())
    as element(ns2:isContactInformationDummyResponse) {
        <ns2:isContactInformationDummyResponse>
            <ns0:result>
                <ns0:code>{ data($isContactInformationDummy1/ERROR_NUM) }</ns0:code>
                <ns0:message>{ data($isContactInformationDummy1/ERROR_STRING) }</ns0:message>
            </ns0:result>
            <ns2:result>{ data($isContactInformationDummy1/RESULT) }</ns2:result>
        </ns2:isContactInformationDummyResponse>
};

declare variable $isContactInformationDummy1 as element() external;

xf:CBO2IsContactInformationDummyResponse($isContactInformationDummy1)
