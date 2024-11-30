public class Program
{
    public static void Main(string[] args)
    {
        string _savepath = args[0];
        string savepath = _savepath.EndsWith("/") ? _savepath : (_savepath + "/");
        byte savetype = System.Convert.ToByte(args[1]);
        string outpath = args[2];
        string mapname = args[3];
        
        cur = new StringBuilder();
        cur.AppendLine("Map Name:" + mapname);
        cur.AppendLine("Map Type:1");
        cur.AppendLine("Holo Sign:0.0, 0.0, 0.0*");
        cur.AppendLine("Camera Pos:0.00, 0.00, 0.00:0.00, 0.00, 0.00");
        cur.AppendLine("Max Vehicle Count: 16");
        cur.AppendLine("Fuel Consume Rate: 2");
        cur.AppendLine("Delete Idle Vehicle: -1");
        cur.AppendLine("Health Regeneration: true");
        cur.AppendLine("Hide Names: false");
        cur.AppendLine("Allow Respawn: true");
        cur.AppendLine("Voice-Chat: enabled");
        cur.AppendLine("Vote For Role: disabled");
        cur.AppendLine("Role-play: disabled");
        cur.AppendLine("Approve On Register: false");
        cur.AppendLine("Roles List:<color=yellow>[TAXI]</color>,<color=#C7C>[WORKER]</color>,[BUILDER],<color=green>[DOCTOR]</color>,<color=orange>[MECHANIC]</color>,<color=blue>[POLICE]</color>,<color=red>[ADMIN]</color>,");
        
        switch (savetype)
        {
            case 0:
                var stream = new System.IO.Compression.GZipStream(System.IO.File.OpenRead(_savepath), System.IO.Compression.CompressionMode.Decompress);
                byte[] level = new byte[stream.Length];
                stream.Read(level);
                stream.Dispose();
                for (int x = 0; x < 256; x++)
                {
                    for (int y = 0; y < 64; y++)
                    {
                        for (int z = 0; z < 256; z++)
                        {
                            id = level[65536 * y + 256 * z + x];
                            if (id != 0)
                                cur.AppendLine(string.Format("Block_Scalable_Editor:{0}.00,{1}.00,{2}.00:0.00,0.00,0.00:2.00,2.00,2.00:color{{1.00,1.00,1.00}} material{{{3},0.25}}", [x * 2, y * 2, z * 2, id]));
                        }
                    }
                }
        
                cur.AppendLine("Downloadable_Content_Material|https://yurkapotam.github.io/mc_first/1.jpg");
                cur.AppendLine("Downloadable_Content_Material|https://yurkapotam.github.io/mc_first/2.jpg");
        
                System.IO.File.WriteAllText(outpath, cur);
            break;
        }
    }
}
