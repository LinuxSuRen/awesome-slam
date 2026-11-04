#!yaml-readme -p data/*.yaml --output README.md --group-by kind

{{- $icons := dict "Dataset" "🗄️" "Fusion" "🧩" "Learning" "📚" "Lidar" "📡" "Tool" "🔧" "Visual" "📷"}}
{{- $descs := dict "Dataset" "公开数据集与基准评测" "Fusion" "多传感器融合与通用优化框架" "Learning" "课程、书籍与教程" "Lidar" "激光与激光惯性 SLAM 系统" "Tool" "评估、可视化与开发工具" "Visual" "视觉与视觉惯性 SLAM 系统"}}
{{- $total := 0}}
{{- range $key, $val := .}}
{{- $total = add $total (len $val)}}
{{- end}}
<div align="center">

# 🗺️ Awesome SLAM

**精选优质 SLAM 资源收录：视觉/激光 SLAM 系统、优化框架、数据集、评估工具……持续更新**

[![Stars](https://img.shields.io/github/stars/LinuxSuRen/awesome-slam?style=flat-square)](https://github.com/LinuxSuRen/awesome-slam/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/LinuxSuRen/awesome-slam?style=flat-square)](https://github.com/LinuxSuRen/awesome-slam/commits)
[![Items](https://img.shields.io/badge/items-{{$total}}-blue?style=flat-square)](#目录)
[![License](https://img.shields.io/badge/license-Apache--2.0-green?style=flat-square)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square)](CONTRIBUTING.md)

</div>

## 目录

{{- range $key, $val := .}}
- {{index $icons $key}} [{{$key}}](#{{lower $key}})（{{len $val}}）
{{- end}}

{{range $key, $val := .}}
<a id="{{lower $key}}"></a>
## {{index $icons $key}} {{$key}}（{{len $val}}）

> {{index $descs $key}}

| Name | Creator |
|---|---|
{{- range $item := $val}}
| [{{$item.name}}]({{$item.link}}) | {{$item.creator}} |
{{- end}}
{{end}}

{{printStarHistory "linuxsuren" "awesome-slam"}}

## Contribution

欢迎推荐新的 SLAM 资源，步骤与字段规范见 [CONTRIBUTING.md](CONTRIBUTING.md)。要点：

1. 在 [data](data) 目录新增一个 YAML 文件（如 `data/my-slam.yaml`），**请勿直接编辑 README.md**
2. `kind` 请使用现有分类，README 由 [generator workflow](.github/workflows/generator.yaml) 自动重新生成
