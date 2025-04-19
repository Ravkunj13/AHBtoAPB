class apb_agent_top extends uvm_env;
  `uvm_component_utils(apb_agent_top)
    apb_agent apb_agt[];
    env_config env_cfg;
   
  
    function new(string name="apb_agent",uvm_component parent);
        super.new(name,parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
    
      env_cfg= env_config::type_id::create("env_cfg",this);
      
      if(!uvm_config_db#(env_config)::get(this,"*","env_config",env_cfg))
       `uvm_fatal("ENV_CONFIG","cannot get env_cfg in apb_agt_top class")
       
      apb_agt=new[env_cfg.no_of_apb_agts];
      
      foreach(apb_agt[i])
      begin
      apb_agt[i]=apb_agent::type_id::create($sformatf("apb_agt[%0d]",i),this);
      end
      
    endfunction
    
 endclass
  

