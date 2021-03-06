
addpath('./code');
init_DE_params;
init_view_selection_params;
MODEL_DIR='./cache_san_marco_basilica';
load([MODEL_DIR '/cameras.mat'],'CameraStruct');
N_images=length('cameras.mat');
ELTS_DIR='./cache_san_marco_basilica/DEs';
mkdir(ELTS_DIR);


indices_to_visit=randperm( (length(CameraStruct))); %this compute all DEs. In practice, you can take less by indices_to_visit=indices_to_visit(1:500)
%% WARNING: this loop should be parallelized
for view_id=1:length(indices_to_visit)
  getDiscriminativElements(view_id,MODEL_DIR,ELTS_DIR,CameraStruct,DE_params,view_params);
end

summarizeDEs(ELTS_DIR,MODEL_DIR,indices_to_visit)
