
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001 World Wide Web Consortium,
(Massachusetts Institute of Technology, Institut National de
Recherche en Informatique et en Automatique, Keio University). All
Rights Reserved. This program is distributed under the W3C's Software
Intellectual Property License. This program is distributed in the
hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.
See W3C License http://www.w3.org/Consortium/Legal/ for more details.

=end
#

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'helper'))

###
#     The string returned by the "getNodeName()" method for an 
#     Attribute Node is the name of the Attribute.
#     
#     Retrieve the Attribute named "domestic" from the last 
#     child of the first employee and check the string returned 
#     by the "getNodeName()" method.   It should be equal to 
#     "domestic". 
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-F68D095]
##
DOMTestCase('nodeattributenodename') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
    ##
    ##   check if loaded documents are supported for content type
    ##
    contentType = getContentType()
    preload(contentType, "staff", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_nodeattributenodename
    doc = nil
    elementList = nil
    testAddr = nil
    addrAttr = nil
    attrName = nil
    doc = load_document("staff", false)
      elementList = doc.getElementsByTagName("address")
      testAddr = elementList.item(0)
      addrAttr = testAddr.getAttributeNode("domestic")
      attrName = addrAttr.nodeName()
      assert_equal("domestic", attrName, "nodeAttributeNodeNameAssert1")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/nodeattributenodename"
  end
end

