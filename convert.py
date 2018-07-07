
import turicreate as tc

#tc.config.set_num_gpus(0)
model = tc.load_model('ObjectDetection.model')
model.export_coreml('ObjectDetection.mlmodel')
