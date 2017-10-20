
getRollFilePath <- function(roll_name){
    f_path = NULL
    if(roll_name == "PQ0330"){
        f_path <- c( "330/PQ0330-1"
                     ,"330/PQ0330-2"
                     ,"330/PQ0330-3"
                     ,"330/PQ0330-4"
                     ,"330/PQ0330-5"
        )
    }else if(roll_name == "PQ0580"){
        f_path <- c( "580/PQ0580-1"
                     ,"580/PQ0580-2"
                     ,"580/PQ0580-3"
                     ,"580/PQ0580-4"
                     ,"580/PQ0580-5"
        )    
    }else if(roll_name == "PQ0330F"){
        f_path <- c( "330/PQ0330_previous pass(full)"
                     ,"330/PQ0330(FULL)"
        )
    }else if(roll_name == "PQ0580F"){
        f_path <- c( "580/PQ0580_previous pass(full)"
                     ,"580/PQ0580(FULL)"
        )    
    }else if(roll_name == "PQ0582"){
        f_path <- c( "582/582-0001"
                     ,"582/582-0002"
                     ,"582/582-0003"
                     ,"582/582-0004"
                     ,"582/582-0005"
                     ,"582/582-0006"
                     ,"582/582-0007"
                     ,"582/582-0008"
        )    
    }else if(roll_name == "PQ0583"){
        f_path <- c( "583/583-0001"
                     ,"583/583-0002"
                     ,"583/583-0003"
                     ,"583/583-0005"
        )    
    }
    return(f_path)
}
