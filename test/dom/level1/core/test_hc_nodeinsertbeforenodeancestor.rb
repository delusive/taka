
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
#     The "insertBefore(newChild,refChild)" method raises a 
#     HIERARCHY_REQUEST_ERR DOMException if the node to be
#     inserted is one of this nodes ancestors.
#     
#     Retrieve the second employee and attempt to insert a
#     node that is one of its ancestors(root node).   An 
#     attempt to insert such a node should raise the 
#     desired exception.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#xpointer(id('ID-258A00AF')/constant[@name='HIERARCHY_REQUEST_ERR'])]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-952280727]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#xpointer(id('ID-952280727')/raises/exception[@name='DOMException']/descr/p[substring-before(.,':')='HIERARCHY_REQUEST_ERR'])]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-952280727]
##
DOMTestCase('hc_nodeinsertbeforenodeancestor') do

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
    preload(contentType, "hc_staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_hc_nodeinsertbeforenodeancestor
    doc = nil
    newChild = nil
    elementList = nil
    employeeNode = nil
    childList = nil
    refChild = nil
    insertedNode = nil
    doc = load_document("hc_staff", true)
      newChild = doc.documentElement()
      elementList = doc.getElementsByTagName("p")
      employeeNode = elementList.item(1)
      childList = employeeNode.childNodes()
      refChild = childList.item(0)
      
    begin
      success = false;
      begin
        insertedNode = employeeNode.insertBefore(newChild, refChild)
      rescue Taka::DOMException => ex
        success = (ex.code == Taka::DOMException::HIERARCHY_REQUEST_ERR)
      end 
      assert(success, "throw_HIERARCHY_REQUEST_ERR")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_nodeinsertbeforenodeancestor"
  end
end

