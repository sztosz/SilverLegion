defmodule SilverLegion do
  def run do
    path = Path.join(File.cwd!(), "Silver_Legion_VI.txt")

    save =
      case(YamlElixir.read_from_file(path)) do
        {:ok, save} -> save
        _ -> raise "Could not read file"
      end

    soldiers =
      save["bases"]
      |> Enum.map(fn base -> base["soldiers"] end)
      |> List.flatten()
      |> Enum.map(&extract_soldier_data/1)

    file = File.stream!("output.csv")

    [csv_headers() | soldiers] |> CSV.encode() |> Enum.into(file)
  end

  defp extract_soldier_data(soldier) do
    soldier |> IO.inspect()

    [
      soldier["name"],
      soldier["type"],
      soldier["missions"],
      soldier["kills"],
      soldier["stuns"],
      # SCORE???
      0,
      soldier["diary"]["daysWoundedTotal"],
      soldier["currentStats"]["bravery"],
      soldier["currentStats"]["firing"],
      soldier["currentStats"]["health"],
      soldier["currentStats"]["mana"],
      soldier["currentStats"]["melee"],
      soldier["currentStats"]["psiSkill"],
      soldier["currentStats"]["psiStrength"],
      soldier["currentStats"]["reactions"],
      soldier["currentStats"]["strength"],
      soldier["currentStats"]["throwing"],
      soldier["currentStats"]["tu"]
    ]
  end

  defp csv_headers do
    [
      "Soldiers",
      "Type",
      "Missions",
      "Kills",
      "Stuns",
      "Score",
      "Days Wounded",
      "Bravery",
      "Firing",
      "Health",
      "Mana",
      "PSI Skill",
      "PSI Strength",
      "Reactions",
      "Stamina",
      "Strength",
      "Throwing",
      "TU"
    ]
  end
end
