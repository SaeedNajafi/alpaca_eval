import os
import yaml
import argparse
from textwrap import dedent

# The YAML template provided by the user.
# Using dedent to remove any leading whitespace from the string.
YAML_TEMPLATE = dedent("""
    model_name:
      completions_kwargs:
        batch_size: 2
        max_new_tokens: 512
        model_name: dummy model path
        model_kwargs:
          torch_dtype: 'bfloat16'
        eos_token_id:
        - 128001
        temperature: 0.01
        top_p: 0.95
      fn_completions: huggingface_local_completions
      pretty_name: dummy model name
      prompt_template: model_name/prompt.txt
""")

def create_model_config(config_root: str, model_name: str, model_path: str):
    """
    Generates a model configuration YAML file from a template.

    This function takes a model name and path, populates a YAML template with
    this information, creates a directory named after the model, and saves
    the configuration as 'config.yaml' inside that directory.

    Args:
        model_name (str): The desired name for the model. This will be used as
                          the top-level key in the YAML, for the 'pretty_name',
                          and as the directory name.
        model_path (str): The file system path to the model weights/files.
    """
    print(f"Generating config for model: '{model_name}'...")

    # Load the string template into a Python dictionary
    try:
        data = yaml.safe_load(YAML_TEMPLATE)
    except yaml.YAMLError as e:
        print(f"Error parsing YAML template: {e}")
        return

    # The original template has a placeholder 'model_name' key.
    # We get its content and will later create a new top-level key with the actual model name.
    if 'model_name' not in data:
        print("Error: The template is missing the placeholder 'model_name' key.")
        return
        
    config_details = data['model_name']

    # Update the values with the provided arguments
    config_details['pretty_name'] = model_name
    config_details['prompt_template'] = f"{model_name}/prompt.txt"
    config_details['completions_kwargs']['model_name'] = model_path

    # Create the final dictionary with the new model name as the top-level key
    output_data = {model_name: config_details}

    # Create the output directory for the model
    try:
        os.makedirs(f"{config_root}/{model_name}", exist_ok=True)
        print(f"Directory '{model_name}/' created or already exists.")
    except OSError as e:
        print(f"Error creating directory {config_root}/{model_name}: {e}")
        return

    # Define the output file path
    output_filepath = os.path.join(config_root, os.path.join(model_name, 'configs.yaml'))

    # Write the updated dictionary to the new config.yaml file
    try:
        with open(output_filepath, 'w') as f:
            # Use sort_keys=False to maintain the order from the template
            yaml.dump(output_data, f, sort_keys=False, indent=2)
        print(f"Successfully wrote config to '{output_filepath}'")
    except IOError as e:
        print(f"Error writing to file {output_filepath}: {e}")


def main():
    """
    Main function to parse command-line arguments and run the script.
    """
    parser = argparse.ArgumentParser(
        description="Populate a YAML model configuration file and create its directory."
    )
    parser.add_argument(
        "--name",
        type=str,
        required=True,
        help="The name of the model (e.g., 'llama2-7b-chat')."
    )
    parser.add_argument(
        "--config_root",
        type=str,
        required=True,
        help="The root dir for the configs."
    )
    parser.add_argument(
        "--path",
        type=str,
        required=True,
        help="The path to the model files (e.g., '/models/llama2-7b-chat')."
    )

    args = parser.parse_args()

    create_model_config(args.config_root, args.name, args.path)


if __name__ == "__main__":
    # This block ensures the code runs only when the script is executed directly
    # and not when imported as a module.
    main()