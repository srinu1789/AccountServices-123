xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://b2b.tracfone.com/MobileAccountServices/v2";
(:: import schema at "../../../xsd/MobileAccountServices_V2.xsd" ::)
declare namespace ns2="http://www.tracfone.com/GroupManagementServices";
(:: import schema at "../../../../../GroupManagementServices/CoreServices/xsd/GroupManagementServices.xsd" ::)

declare namespace com = "http://www.tracfone.com/CommonTypes";

declare variable $deleteGroupRequest as element() (:: schema-element(ns1:deleteGroupRequest) ::) external;


declare function local:DeleteGroupRequest($deleteGroupRequest as element() (:: schema-element(ns1:deleteGroupRequest) ::) ) as element() (:: schema-element(ns2:deleteGroupRequest) ::) {
    <ns2:deleteGroupRequest>
        <com:requestToken>
            <com:clientTransactionId>{fn:data($deleteGroupRequest/com:requestToken/com:clientTransactionId)}</com:clientTransactionId>
            <com:clientId>{fn:data($deleteGroupRequest/com:requestToken/com:clientId)}</com:clientId>
        </com:requestToken>
        <com:brandName>{fn:data($deleteGroupRequest/com:brandName)}</com:brandName>
        <com:sourceSystem>{fn:data($deleteGroupRequest/com:sourceSystem)}</com:sourceSystem>
        {
            if ($deleteGroupRequest/com:language)
            then <com:language>{fn:data($deleteGroupRequest/com:language)}</com:language>
            else ()
        }
        <ns2:groupID>{fn:data($deleteGroupRequest/ns1:group/ns1:groupId)}</ns2:groupID>
		
    </ns2:deleteGroupRequest>
};

local:DeleteGroupRequest($deleteGroupRequest)