xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.tracfone.com/AccountCoreServices";
(:: import schema at "../xsd/AccountCoreServices.xsd" ::)

declare variable $isContactInformationDummyRequestParam as element() (:: schema-element(ns1:isContactInformationDummyRequest) ::) external;

declare function local:func($isContactInformationDummyRequestParam as element() (:: schema-element(ns1:isContactInformationDummyRequest) ::)) {
    <INPUT TASK="isContactInformationDummy">
        <WEB_OBJID>{fn:data($isContactInformationDummyRequestParam/ns1:webObjid)}</WEB_OBJID>
    </INPUT>
};

local:func($isContactInformationDummyRequestParam)
