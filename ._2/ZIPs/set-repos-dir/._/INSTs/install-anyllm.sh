#!/bin/bash

#x gitr clone anythingllm_prod1-master  master -d ${aRepo}
#  gitr clone anythingllm_prod1-master  master -d;  aRepo="AnyLLM_prod1-master"
#  gitr clone anythingllm_/prod1-master        -d;  aRepo="AnyLLM_/prod1-master"
#  gitr clone anythingllm  no-stage            -d;  aRepo="AnyLLM"
#  gitr clone anythingllm  -d

#  ----------------------------------------------------------------------------

   gitr clone anythingllm  no-stage -d;  aRepo="AnyLLM"

   cd ${aRepo}

   frt install ALTools -d

   anyllm setup
   anyllm copy env