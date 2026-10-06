# Can the Rookies Cut the Tough Cookie? Exploring the Use of LLMs for SQL Equivalence Checking
Rajat Singh (rajat.singh@cse.iitd.ac.in), Srikanta Bedathur (srikanta@cse.iitd.ac.in)
<hr>


## Environment Details
We use Python 3.9.18 to run each file. We use PyTorch '2.2.1' with CUDA '12.1.105'. 


## Instructions to Run Code
The 'result' folder contains three folders, each containing code for each dataset. The code in these folders is arranged according to the prompting pipeline given in the paper. To get the result, you must run the '.ipynb' files in this folder; before running these .ipynb files, please make the following changes: <br>
- Update the API keys for Gemini-Pro and GPT in the code (.ipynb files).
- Download the relevant models (specifically CodeLLama-7B and CodeLLama-13B) from Hugging Face (https://huggingface.co).
- Update all the paths in the config file.

## Instructions for fine-tuning the model
The 'finetune' folder contains all the files required for fine-tuning. The dataset we used to fine-tune is in the 'finetune/dataset' folder, and the script used to fine-tune the model is in the 'finetune\script' folder. Before running the finetuning code ('finetune.ipynb'), please make the following changes: <br>
- Download the relevant models (specifically CodeLLama-13B) from Hugging Face (https://huggingface.co).
- Update all the paths in the 'finetune.ipynb' file.
