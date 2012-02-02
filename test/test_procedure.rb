$: << File.expand_path(File.dirname(__FILE__) + '/../lib')
require 'test/unit'
require 'proper_process_api_ares'
require 'fakeweb'

class ProcedureTest < Test::Unit::TestCase
  
  def setup
    # Simulate a YAML config file
    @test_config = { "api_key" => "f64eedc6649c0b8968eabfc0eb0b1c52d2c5e783", "site" => "http://example.com"}
    
    ProperProcess.configure do |c|
      c.site    = @test_config['site']
      c.api_key = @test_config['api_key']
    end
    
    FakeWeb.allow_net_connect = false
  end

  def teardown
    FakeWeb.allow_net_connect = true 
    FakeWeb.clean_registry
  end
  
  def test_should_get_all_procedures
    FakeWeb.register_uri(:get, "http://#{@test_config['api_key']}:x@example.com/procedures.json", :body => '[{"procedure":{"snapshots_count":null,"name":"Procedure 3 Testing schedules","created_at":null,"assets_count":0,"updated_at":null,"overview":"<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#8217;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>","orig_source_id":null,"account_id":2,"id":3,"sample_request":null,"requirements":null,"company_id":2,"responsible_user_id":710149061,"is_public":false,"description":"<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>"}},{"procedure":{"snapshots_count":null,"name":"Validation Tests on creating schedules","created_at":null,"assets_count":0,"updated_at":null,"overview":null,"orig_source_id":null,"account_id":2,"id":4,"sample_request":null,"requirements":null,"company_id":2,"responsible_user_id":710149061,"is_public":false,"description":null}}]')
    procedures = ProperProcess::Procedure.find(:all)
    assert_not_nil procedures
    assert procedures.kind_of? Array
    assert_equal 2, procedures.size
  end
  
  def test_should_get_a_procedure
    FakeWeb.register_uri(:get, "http://#{@test_config['api_key']}:x@example.com/procedures/3.json", :body => '{"procedure":{"snapshots_count":null,"name":"Procedure 3 Testing schedules","created_at":null,"assets_count":0,"updated_at":null,"overview":"<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#8217;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>","orig_source_id":null,"account_id":2,"id":3,"sample_request":null,"requirements":null,"company_id":2,"responsible_user_id":710149061,"is_public":false,"description":"<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>"}}' )
    procedure = ProperProcess::Procedure.find(3)
    assert_not_nil procedure
    assert procedure.kind_of? ProperProcess::Procedure
  end

end